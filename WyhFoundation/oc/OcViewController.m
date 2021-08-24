//
//  OcViewController.m
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/5/19.
//

#import "OcViewController.h"

@interface OcViewController ()<UITableViewDelegate, UITableViewDataSource>
@property(nonatomic, strong)UITableView * table;
@property(nonatomic, strong)NSArray<NSString* > * dataArr;
@end

@implementation OcViewController
-(UITableView *)table {
    
    if (_table == nil) {
        _table = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        [_table registerClass:[UITableViewCell self] forCellReuseIdentifier:@"cell"];
    }
   
    return _table;
}
-(NSArray *)dataArr {
    if (_dataArr == nil) {
        _dataArr = @[@"1"];
    }    
    return _dataArr;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self.navi setNaviType:back];
    self.navi.titile.text = @"Objective-C";
    
    self.table.delegate = self;
    self.table.dataSource = self;
    NSString *s = @"";
    [self.view addSubViews:@[self.table]];

    [self.table mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.navi.mas_bottom);
        make.right.bottom.left.equalTo(self.view);
        
    }];
    // Do any additional setup after loading the view.
}

//MARK: table代理
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    return  cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return  UITableViewAutomaticDimension;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
