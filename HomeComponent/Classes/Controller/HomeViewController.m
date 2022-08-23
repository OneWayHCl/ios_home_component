//
//  HomeViewController.m
//  HomeComponent
//
//  Created by apple on 2022/1/10.
//

#import "HomeViewController.h"
#import <CWLateralSlide/UIViewController+CWLateralSlide.h>
#import "SlideViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"首页";
    
//    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 375, 200)];
//    headView.backgroundColor = [UIColor grayColor];
//    self.tableView.tableHeaderView = headView;
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithTitle:@"左侧" style:UIBarButtonItemStylePlain target:self action:@selector(leftItemAction)];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"右侧" style:UIBarButtonItemStylePlain target:self action:@selector(rightItemAction)];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    // 注册手势驱动
    __weak typeof(self)weakSelf = self;
    // 第一个参数为是否开启边缘手势，开启则默认从边缘50距离内有效，第二个block为手势过程中我们希望做的操作
    [self cw_registerShowIntractiveWithEdgeGesture:NO transitionDirectionAutoBlock:^(CWDrawerTransitionDirection direction) {
        //NSLog(@"direction = %ld", direction);
        if (direction == CWDrawerTransitionFromLeft) { // 左侧滑出
            [weakSelf leftItemAction];
        } else if (direction == CWDrawerTransitionFromRight) { // 右侧滑出
            [weakSelf rightItemAction];
        }
    }];
}

- (void)leftItemAction {
    SlideViewController *vc = [[SlideViewController alloc] init];
    
    CWLateralSlideConfiguration *config = [CWLateralSlideConfiguration configurationWithDistance:200 maskAlpha:0.4 scaleY:1 direction:CWDrawerTransitionFromLeft backImage:nil];
    
    [self cw_showDrawerViewController:vc animationType:CWDrawerAnimationTypeDefault configuration:config];
}

- (void)rightItemAction {
    SlideViewController *vc = [[SlideViewController alloc] init];
    
    CWLateralSlideConfiguration *config = [CWLateralSlideConfiguration configurationWithDistance:0 maskAlpha:0.4 scaleY:0.8 direction:CWDrawerTransitionFromRight backImage:nil];
    
    [self cw_showDrawerViewController:vc animationType:CWDrawerAnimationTypeDefault configuration:config];
}

#pragma mark - UITableView数据源和代理方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 30;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell= [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:NSStringFromClass([UITableViewCell class])];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"测试数据%ld",indexPath.row];
    cell.imageView.image = [self getImageWithName:@"a02_01_shouyrw"];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 选中后立即取消选中状态
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

//左滑删除
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
- (nullable NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewRowAction *deleteAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"删除" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
        //Do delete something here.
    }];
    deleteAction.backgroundColor = [UIColor redColor];
    return @[deleteAction];
}

- (UIImage *)getImageWithName:(NSString *)imageName {
    NSBundle *bundle = [NSBundle bundleForClass:self.class];
    if (bundle) {
        NSString *path = bundle.bundlePath.lastPathComponent;
        NSString *resource = path.stringByDeletingPathExtension;
        NSURL *url = [bundle URLForResource:resource withExtension:@"bundle"];
        if (url) {
            NSBundle *module = [NSBundle bundleWithURL:url];
            UIImage *image = [UIImage imageNamed:imageName inBundle:module compatibleWithTraitCollection:nil];
            return image;
        }
    }
    return nil;
}
@end
