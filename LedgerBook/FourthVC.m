#import "FourthVC.h"
@interface FourthVC ()
@property Boolean jump;
@end
@implementation FourthVC
- (void)viewDidLoad {
    [super viewDidLoad];
    self.jump=NO;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
-(void) viewDidAppear:(BOOL)animated{
    if(self.jump){
        UITabBarController *tab=(UITabBarController*)self.tabBarController;
        tab.selectedIndex=1;
        self.jump=NO;
    }
}
- (void) setJumpToAddItemVC {
    self.jump=YES;
}
@end
