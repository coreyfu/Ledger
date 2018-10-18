#import <UIKit/UIKit.h>
#import "Ledger.h"
@interface drawPie : UIView{
@private int inArray[9];
@private int outArray[12];
@private int sumOut,sumIn;
}
-(void) setChoice:(int) choice;
@property int segChoice;
@property NSMutableArray* ledgerArray;
@end
