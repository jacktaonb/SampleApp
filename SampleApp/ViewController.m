//
//  ViewController.m
//  SampleApp
//
//  Created by 王韬 on 2020/11/1.
//

#import "ViewController.h"
#import "GTNormalTableViewCell.h"

@interface TestView : UIView

@end

@implementation TestView

- (instancetype)init{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)willMoveToSuperview:(nullable UIView *)newSuperview{
    [super willMoveToSuperview:newSuperview];
}

- (void)didMoveToSuperview{
    [super didMoveToSuperview];
}

- (void)willMoveToWindow:(nullable UIWindow *)newWindow{
    [super willMoveToWindow:newWindow];
}

- (void)didMoveToWindow{
    [super didMoveToWindow];
}

@end

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation ViewController

-(instancetype)init{
    self = [super init];
    if (self) {
        
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UITableView *tableview = [[UITableView alloc] initWithFrame:self.view.bounds];
    
    tableview.dataSource = self;
    tableview.delegate = self;
    [self.view addSubview:tableview];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIViewController *view = [[UIViewController alloc] init];
    view.view.backgroundColor = [UIColor whiteColor];
    view.title = [NSString stringWithFormat:@"%@",@(indexPath.row)];
    [self.navigationController pushViewController:view animated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  20;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    GTNormalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"id"];
    if(!cell){
        cell = [[GTNormalTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"id"];
    }
    
    [cell layoutTableViewCell];
    return  cell;
}



@end
