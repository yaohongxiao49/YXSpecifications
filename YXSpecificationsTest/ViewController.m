//
//  ViewController.m
//  YXSpecificationsTest
//
//  Created by ios on 2020/12/11.
//

#import "ViewController.h"
#import "YXMallSpecificationsAlertView.h"

@interface ViewController ()

@property (nonatomic, strong) YXMallSpecificationsAlertView *alertView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    TYAlertController *alertController = [TYAlertController alertControllerWithAlertView:self.alertView preferredStyle:TYAlertControllerStyleActionSheet];
    alertController.backgoundTapDismissEnable = YES;
    self.alertView.alertController = alertController;
    [self presentViewController:alertController animated:YES completion:nil];
}

- (YXMallSpecificationsAlertView *)alertView {
    
    if (!_alertView) {
        _alertView = [[YXMallSpecificationsAlertView alloc] initWithFrame:CGRectMake(0, [[UIScreen mainScreen] bounds].size.height - 490, [[UIScreen mainScreen] bounds].size.width, 490) boolMsgStay:YES boolBottomStay:YES];
        _alertView.backgroundColor = [UIColor whiteColor];
    }
    return _alertView;
}

@end
