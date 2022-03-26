//
//  HomeViewController.m
//  HomeComponent
//
//  Created by apple on 2022/1/10.
//

#import "HomeViewController.h"
#import "OcVcUseSwiftExampleVc.h"
#import <HomeComponent/HomeComponent-Swift.h>
#import "HomeTableViewCell.h"
//#import <LHPerformanceStatusBar/LHPerformanceMonitorService.h>
//#import "LHPerformanceMonitorService.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"首页";
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
//    self.tableView.layer.masksToBounds = YES;
    
//    [LHPerformanceMonitorService run];
}

#pragma mark - UITableView数据源和代理方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10000;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    UITableViewCell *cell= [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])];
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:NSStringFromClass([UITableViewCell class])];
//    }
//    sleep(1);
    HomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HomeTableViewCell"];
    if (cell == nil) {
        cell = [[NSBundle bundleForClass:[HomeTableViewCell class]] loadNibNamed:@"HomeTableViewCell" owner:self options:nil].lastObject;
    }
//    cell.textLabel.text = [NSString stringWithFormat:@"测试数据%ld",indexPath.row];
    cell.headImageView.image = [self getImageWithName:@"a02_01_shouyrw"];

    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 选中后立即取消选中状态
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    
    if (indexPath.row == 0) {
        SwiftVcExample *vc = [SwiftVcExample new];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (indexPath.row == 1) {
        OcVcUseSwiftExampleVc *vc = [OcVcUseSwiftExampleVc new];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (indexPath.row == 2) {
//        SwiftVcOcExample *vc = [SwiftVcOcExample new];
//        vc.hidesBottomBarWhenPushed = YES;
//        [self.navigationController pushViewController:vc animated:YES];
    }
    else {
//        HomeDetailController *vc = [HomeDetailController new];
//        [self.navigationController pushViewController:vc animated:YES];
    }
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
