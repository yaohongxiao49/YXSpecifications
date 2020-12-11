//
//  YXMallSpecificationsAlertView.m
//  YXSpecificationsTest
//
//  Created by ios on 2020/12/11.
//

#import "YXMallSpecificationsAlertView.h"
#import "YXMallSpecificationsAlertHeaderView.h"
#import "YXMallSpecificationsAlertFooterView.h"
#import "YXMallSpecificationsAlertCell.h"
#import "YXMallSpecificationsAlertSecHeaderView.h"

@interface YXMallSpecificationsAlertView () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, assign) BOOL boolMsgStay; //商品信息是否保持在顶部
@property (nonatomic, assign) BOOL boolBottomStay; //底部视图是否保持在底部
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) YXMallSpecificationsAlertHeaderView *headerView;
@property (nonatomic, strong) YXMallSpecificationsAlertFooterView *footerView;
@property (nonatomic, strong) YXMallSpecificationsModel *model;

@property (nonatomic, strong) NSMutableArray *goodsSpecificationMsgArr;
@property (nonatomic, strong) NSMutableArray *goodsSpecificationMsgFirstArr;
@property (nonatomic, strong) NSMutableArray *goodsSpecificationMsgSecondArr;

@end

@implementation YXMallSpecificationsAlertView

- (instancetype)initWithFrame:(CGRect)frame boolMsgStay:(BOOL)boolMsgStay boolBottomStay:(BOOL)boolBottomStay {
    self = [super initWithFrame:frame];
    
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloaValueNotice) name:kYXMallSpecificationsReloadValueNoti object:nil];
        
        _boolMsgStay = boolMsgStay;
        _boolBottomStay = boolBottomStay;
        
        [self initView];
        [self initDataSource];
    }
    return self;
}

#pragma mark - 通知刷新数据
- (void)reloaValueNotice {
    
    [_tableView reloadData];
}

#pragma mark - 视图显示大小
- (void)judgeViewShowFrame {
    
    if (_boolMsgStay) {
        [self addSubview:self.headerView];
        _tableView.frame = CGRectMake(0, self.headerView.bounds.size.height, self.bounds.size.width, self.bounds.size.height - self.headerView.bounds.size.height);
    }
    else {
        _tableView.frame = self.bounds;
        _tableView.tableHeaderView = self.headerView;
    }
    
    if (_boolBottomStay) {
        self.footerView.frame = CGRectMake(0, self.bounds.size.height - 50, self.bounds.size.width, 50);
        [self addSubview:self.footerView];
        
        if (_boolMsgStay) {
            _tableView.frame = CGRectMake(0, self.headerView.bounds.size.height, self.bounds.size.width, self.bounds.size.height - self.headerView.bounds.size.height - self.footerView.bounds.size.height);
        }
        else {
            _tableView.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height - self.footerView.bounds.size.height);
        }
    }
    else {
        if (_boolMsgStay) {
            _tableView.frame = CGRectMake(0, self.headerView.bounds.size.height, self.bounds.size.width, self.bounds.size.height - self.headerView.bounds.size.height);
        }
        else {
            _tableView.frame = self.bounds;
        }
        _tableView.tableFooterView = self.footerView;
    }
}

#pragma mark - <UITableViewDelegate, UITableViewDataSource>
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return _model.goodsSpecificationMsgArr.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    YXMallSpecificationsAlertCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([YXMallSpecificationsAlertCell class])];
    [cell reloadValueByIndexPath:indexPath arr:_model.goodsSpecificationMsgArr];
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    YXMallSpecificationsAlertSecHeaderView *view = [[[NSBundle mainBundle] loadNibNamed:[YXMallSpecificationsAlertSecHeaderView.class description] owner:self options:nil] lastObject];
    view.frame = CGRectMake(0, 0, tableView.bounds.size.width, tableView.sectionHeaderHeight);
    [view reloadValueByIndex:section model:_model type:section == (_model.goodsSpecificationMsgArr.count - 1) ? YXMallSpecificationsAlertSecHVTypeNum : YXMallSpecificationsAlertSecHVTypeNormal];
    
    return view;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    
    return [UIView new];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return UITableViewAutomaticDimension;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 36.f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return 0.01f;
}

#pragma mark - setting
- (void)setAlertController:(TYAlertController *)alertController {
    
    _alertController = alertController;
    
    self.headerView.alertController = _alertController;
    self.footerView.alertController = _alertController;
}

#pragma mark - 初始化视图
- (void)initView {
    
    _tableView = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.estimatedRowHeight = 100;
    _tableView.separatorStyle = UITableViewCellAccessoryNone;
    _tableView.backgroundColor = [UIColor clearColor];
    [self addSubview:_tableView];
    
    [_tableView registerNib:[UINib nibWithNibName:[YXMallSpecificationsAlertCell.class description] bundle:nil] forCellReuseIdentifier:NSStringFromClass([YXMallSpecificationsAlertCell class])];
    
    [self judgeViewShowFrame];
}

#pragma mark - 初始化数据
- (void)initDataSource {
    
    NSDictionary *dic = @{@"imgUrl":@"", @"goodsPrice":@"12", @"goodsSpecificationNum":@"205634", @"goodsCurrentNum":@(1), @"goodsMaxNum":@(5), @"goodsMinNum":@(1), @"goodsSpecificationMsgArr":self.goodsSpecificationMsgArr};
    _model = [[YXMallSpecificationsModel alloc] initWithDic:dic];
    
    self.headerView.model = _model;
    
    [_tableView reloadData];
}

#pragma mark - 懒加载
- (YXMallSpecificationsAlertHeaderView *)headerView {
    
    if (!_headerView) {
        _headerView = [[[NSBundle mainBundle] loadNibNamed:[YXMallSpecificationsAlertHeaderView.class description] owner:self options:nil] lastObject];
        _headerView.frame = CGRectMake(0, 0, self.bounds.size.width, 135);
    }
    return _headerView;
}
- (YXMallSpecificationsAlertFooterView *)footerView {
    
    if (!_footerView) {
        _footerView = [[[NSBundle mainBundle] loadNibNamed:[YXMallSpecificationsAlertFooterView.class description] owner:self options:nil] lastObject];
        _footerView.frame = CGRectMake(0, 0, self.bounds.size.width, 50);
    }
    return _footerView;
}
- (NSMutableArray *)goodsSpecificationMsgArr {
    
    if (!_goodsSpecificationMsgArr) {
        _goodsSpecificationMsgArr = [[NSMutableArray alloc] init];
        NSDictionary *dic;
        
        dic = @{@"goodSpecificationsFatherIdent":@"1", @"goodSpecificationsFatherTitle":@"规格", @"goodSpecificationsSonArr":(NSArray *)self.goodsSpecificationMsgFirstArr};
        [_goodsSpecificationMsgArr addObject:dic];
        
        dic = @{@"goodSpecificationsFatherIdent":@"2", @"goodSpecificationsFatherTitle":@"颜色", @"goodSpecificationsSonArr":(NSArray *)self.goodsSpecificationMsgSecondArr};
        [_goodsSpecificationMsgArr addObject:dic];
        
        dic = @{@"goodSpecificationsFatherIdent":@"3", @"goodSpecificationsFatherTitle":@"数量", @"goodSpecificationsSonArr":@[]};
        [_goodsSpecificationMsgArr addObject:dic];
    }
    return _goodsSpecificationMsgArr;
}
- (NSMutableArray *)goodsSpecificationMsgFirstArr {
    
    if (!_goodsSpecificationMsgFirstArr) {
        _goodsSpecificationMsgFirstArr = [[NSMutableArray alloc] init];
        
        NSDictionary *dic;
        dic = @{@"goodSpecificationsSonIdent":@"1", @"goodSpecificationsSonTitle":@"单次", @"boolSelected":@(NO)};
        [_goodsSpecificationMsgFirstArr addObject:dic];
        
        dic = @{@"goodSpecificationsSonIdent":@"2", @"goodSpecificationsSonTitle":@"季卡", @"boolSelected":@(NO)};
        [_goodsSpecificationMsgFirstArr addObject:dic];
        
        dic = @{@"goodSpecificationsSonIdent":@"3", @"goodSpecificationsSonTitle":@"年卡", @"boolSelected":@(NO)};
        [_goodsSpecificationMsgFirstArr addObject:dic];
        
        dic = @{@"goodSpecificationsSonIdent":@"3", @"goodSpecificationsSonTitle":@"年卡", @"boolSelected":@(NO)};
        [_goodsSpecificationMsgFirstArr addObject:dic];
        
        dic = @{@"goodSpecificationsSonIdent":@"3", @"goodSpecificationsSonTitle":@"年卡", @"boolSelected":@(NO)};
        [_goodsSpecificationMsgFirstArr addObject:dic];
        
        dic = @{@"goodSpecificationsSonIdent":@"3", @"goodSpecificationsSonTitle":@"年卡", @"boolSelected":@(NO)};
        [_goodsSpecificationMsgFirstArr addObject:dic];
    }
    return _goodsSpecificationMsgFirstArr;
}
- (NSMutableArray *)goodsSpecificationMsgSecondArr {
    
    if (!_goodsSpecificationMsgSecondArr) {
        _goodsSpecificationMsgSecondArr = [[NSMutableArray alloc] init];
        
        NSDictionary *dic;
        dic = @{@"goodSpecificationsSonIdent":@"1", @"goodSpecificationsSonTitle":@"红色", @"boolSelected":@(NO)};
        [_goodsSpecificationMsgSecondArr addObject:dic];
        
        dic = @{@"goodSpecificationsSonIdent":@"2", @"goodSpecificationsSonTitle":@"黄色", @"boolSelected":@(NO)};
        [_goodsSpecificationMsgSecondArr addObject:dic];
        
        dic = @{@"goodSpecificationsSonIdent":@"3", @"goodSpecificationsSonTitle":@"蓝色", @"boolSelected":@(NO)};
        [_goodsSpecificationMsgSecondArr addObject:dic];
    }
    return _goodsSpecificationMsgSecondArr;
}

@end
