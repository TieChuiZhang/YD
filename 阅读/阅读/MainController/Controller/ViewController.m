//
//  ViewController.m
//  阅读
//
//  Created by Lee on 2017/11/28.
//  Copyright © 2017年 Lee. All rights reserved.
//

#import "ViewController.h"
#import "MainViewCell.h"

#define DOCSFOLDER [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"]
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,XDSReadManagerDelegate>

/** <#注释#> */
@property (nonatomic, strong) UITableView *tableView;


/**  */
@property (nonatomic, strong) NSMutableArray *data;

/** <#注释#> */
@property (nonatomic, strong) XDSReadManager *manager;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    // Do any additional setup after loading the view, typically from a nib
//    if (@available(iOS 11.0, *)) {
//        self.tableView.contentInsetAdjustmentBehavior = UIApplicationBackgroundFetchIntervalNever;
//    } else {
//        self.automaticallyAdjustsScrollViewInsets = false;
//        // Fallback on earlier versions
//    }
}

- (void)dropRefresh
{
    LeeWeakSelf(self);
    MJRefreshGifHeader *header = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(fetchDataFile)];
    // 设置普通状态的动画图片
    //[header setImages:@"" forState:MJRefreshStateIdle];
    // 设置即将刷新状态的动画图片（一松开就会刷新的状态）
    //[header setImages:@"" forState:MJRefreshStatePulling];
    // 设置正在刷新状态的动画图片
    //[header setImages:@"" forState:MJRefreshStateRefreshing];
    // 隐藏时间
    header.lastUpdatedTimeLabel.hidden = YES;
    // 隐藏状态
    // header.stateLabel.hidden = YES;
    // 设置header
    weakself.tableView.mj_header = header;
}

- (void)fetchDataFile
{
    NSString *docsDir = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];

    NSFileManager *fileManager = [NSFileManager defaultManager];
 
    NSDirectoryEnumerator *dirEnum = [fileManager enumeratorAtPath:docsDir];
    
    NSString *fileName;
    
    NSMutableArray *marr = [NSMutableArray array];
    
    while (fileName = [dirEnum nextObject]) {
        if([fileName rangeOfString:@"-1"].location !=NSNotFound)
        {
           // NSLog(@"yes");
            //NSLog(@"%@",fileName);
            [self deleteFile:fileName];
            [self.tableView.mj_header endRefreshing];
        }
        else {
            if([fileName rangeOfString:@".txt"].location !=NSNotFound)
            {
                NSString *fileName1 = [fileName stringByDeletingPathExtension];
                [marr addObject:fileName1];
                [NSSet setWithArray:marr];
                self.data = marr;
                [self.tableView reloadData];
                [self.tableView.mj_header endRefreshing];
            }
            
        }
    }
    
}

- (void)deleteFile:(NSString *)fileName
{
    NSFileManager* fileManager=[NSFileManager defaultManager];
    NSString *docsDir = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    //文件名
    NSString *uniquePath=[docsDir  stringByAppendingPathComponent:fileName];
    BOOL blHave=[[NSFileManager defaultManager] fileExistsAtPath:uniquePath];
    if (!blHave) {
        //NSLog(@"没有该文件");
        return ;
    }else {
        //NSLog(@"有呀");
        BOOL blDele= [fileManager removeItemAtPath:uniquePath error:nil];
        if (blDele) {
            //NSLog(@"删除成功");
        }else {
            //NSLog(@"未删除成功");
        }
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cell";
    MainViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[MainViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    cell.name = self.data[indexPath.row];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSString *docsDir = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/Inbox"];
    if(![[NSFileManager defaultManager] fileExistsAtPath:docsDir]){
        NSURL *fileURL = [[NSBundle mainBundle] URLForResource:@"简介"withExtension:@"txt"];
        [self showReadPageViewControllerWithFileURL:fileURL];
    } else{
        NSString *txtPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
        NSString *str = [NSString stringWithFormat:@"%@.txt",self.data[indexPath.row]];
        NSString *filePath = [txtPath stringByAppendingPathComponent:str];
        NSURL *fileURL = [NSURL fileURLWithPath:filePath];
        //NSLog(@"2010201:%@",fileURL);
        [self showReadPageViewControllerWithFileURL:fileURL];
    }
}


- (void)showReadPageViewControllerWithFileURL:(NSURL *)fileURL{
    if (nil == fileURL) {
        return;
    }
    __weak typeof (self)weak_Self = self;
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        XDSBookModel *bookModel = [XDSBookModel getLocalModelWithURL:fileURL];
        
        //float a = 1.0*bookModel.record.currentChapter/bookModel.chapters.count;
        dispatch_async(dispatch_get_main_queue(), ^{
            XDSReadPageViewController *pageView = [[XDSReadPageViewController alloc] init];
            [weak_Self.manager setBookModel:bookModel];
            [weak_Self.manager setResourceURL:fileURL];
            [weak_Self.manager setRmDelegate:pageView];
            
            [weak_Self presentViewController:pageView animated:YES completion:nil];
        });
    });
}

-(void)viewDidLayoutSubviews
{
    
    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.tableView setSeparatorInset:UIEdgeInsetsZero];
        
    }
    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)])  {
        [self.tableView setLayoutMargins:UIEdgeInsetsZero];
    }
    
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPat
{
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]){
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSNotificationCenter *notiCenter = [NSNotificationCenter defaultCenter];
    [notiCenter addObserver:self selector:@selector(receiveNotification:) name:@"zaici" object:nil];
    [notiCenter addObserver:self selector:@selector(errorNotification:) name:@"error" object:nil];
}

- (void)errorNotification:(NSNotification *)not
{
    SHOW_TEXT(@"有了");
}


- (void)receiveNotification:(NSNotification *)not
{
    NSString *docsDir = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/Inbox"];
    if(![[NSFileManager defaultManager] fileExistsAtPath:docsDir]){
        NSString *str = @"简介";
        [self.data removeAllObjects];
        [self.data addObject:str];
        [self.tableView reloadData];
    } else{
        [self.data removeAllObjects];
        [self dropRefresh];
        [self fetchDataFile];
    }
    //[_tableView.mj_header beginRefreshing];
}

- (UITableView *)tableView
{
    if (!_tableView) {
        
        _tableView = [[UITableView alloc] init];
        
        [_tableView setDataSource:self];
        [_tableView setDelegate:self];
        if (KIsiPhoneX) {
            self.tableView.contentInset = UIEdgeInsetsMake(-10, 0, 0, 0);
        }
        // self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
        
        UIImageView *backImageView=[[UIImageView alloc]initWithFrame:self.view.bounds];
        
        [backImageView setImage:[UIImage imageNamed:@"water_mode_bg@2x"]];
        
        _tableView.backgroundView = backImageView;
        
        self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
        
        // self.tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
        
        _tableView.rowHeight = UITableViewAutomaticDimension;
        
        _tableView.estimatedRowHeight = 44;
        
        [self.tableView registerNib:[UINib nibWithNibName:@"MainViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"cell"];
        
        [self.view addSubview:self.tableView];
        
        __weak typeof (self)weak_Self = self;
        
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            if (KIsiPhoneX) {
                make.top.equalTo(weak_Self.view.mas_top);
            }else {
                make.top.equalTo(weak_Self.view.mas_top).offset(20);
            }
            make.left.equalTo(weak_Self.view.mas_left);
            make.right.equalTo(weak_Self.view.mas_right);
            make.bottom.equalTo(weak_Self.view.mas_bottom);
            
        }];
    }
    return _tableView;
}

- (XDSReadManager *)manager
{
    if (!_manager) {
        _manager = [XDSReadManager sharedManager];
    }
    return _manager;
}


- (NSMutableArray *)data
{
    if (!_data) {
        _data = [NSMutableArray array];
    }
    return _data;
}

- (void)dealloc
{
    //NSLog(@"释放了%@",self.class);
}


@end
