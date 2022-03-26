//
//  OcVcUseSwiftExampleVc.m
//  HomeComponent
//
//  Created by hcl on 2022/3/2.
//

#import "OcVcUseSwiftExampleVc.h"
#import <HomeComponent/HomeComponent-Swift.h>

@interface OcVcUseSwiftExampleVc ()

@end

@implementation OcVcUseSwiftExampleVc

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"OC控制器（Swift:view和cell）";
    
    OcVcUseSwiftView *headView = [[NSBundle bundleForClass:[OcVcUseSwiftView class]] loadNibNamed:@"OcVcUseSwiftView" owner:self options:nil].lastObject;
//    headView.headLabel.text = @"OC-VC-Use-Swift-Xib-View";
    UIView *head = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 100)];
    [head addSubview:headView];
    self.tableView.tableHeaderView = head;
    
    HomeSwiftOcUseFoot *footView = [[HomeSwiftOcUseFoot alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 100)];
    footView.headLabel.text = @"OC-VC-Use-Swift-Code-View";
    self.tableView.tableFooterView = footView;
}

#pragma mark - UITableView数据源和代理方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell= [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:NSStringFromClass([UITableViewCell class])];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"首页数据%ld",indexPath.row];
    
    if (indexPath.row % 2 == 0) {
        OcVcUseSwiftCell *cell0 = [tableView dequeueReusableCellWithIdentifier:@"OcVcUseSwiftCell"];
        if (cell0 == nil) {
            cell0 = [[NSBundle bundleForClass:[OcVcUseSwiftCell class]] loadNibNamed:@"OcVcUseSwiftCell" owner:self options:nil].lastObject;
        }
//        cell0.customLabel.text = @"OC控制器-(Swift-xib-cell)";
        return cell0;
    }
    else {
        HomeSwiftOcCell *cell0 = [tableView dequeueReusableCellWithIdentifier:@"HomeSwiftOcCell"];
        if (cell0 == nil) {
            cell0 = [[HomeSwiftOcCell alloc] init];
        }
        cell0.customSubTitleLabel.text = @"OC控制器-(Swift-code-cell)";
        return cell0;
    }

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 选中后立即取消选中状态
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    

}

@end
