#import "ScanerView.h"
@interface ScanerView()
@property (nonatomic, strong) UIImageView *qrLine;
@property (nonatomic, assign, readwrite) CGRect scanAreaRect;
@end
@implementation ScanerView
- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder])
        [self customInit];
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame])
        [self customInit];
    return self;
}
- (void)customInit{
    self.backgroundColor = [UIColor clearColor];
}
- (CGRect)scanAreaRect{
    _scanAreaRect = CGRectMake(CGRectGetWidth(self.frame) / 2 - self.scanAreaEdgeLength / 2,
                               CGRectGetHeight(self.frame) / 2 - self.scanAreaEdgeLength / 2,
                               self.scanAreaEdgeLength,
                               self.scanAreaEdgeLength);
    return _scanAreaRect;
}
- (void)startMoveLine{
    if (self.qrLine)
        [self.qrLine removeFromSuperview];
    self.qrLine = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ff_QRCodeScanLine"]];
    self.qrLine.frame = CGRectMake(0,
                                   0,
                                   CGRectGetWidth(self.frame),
                                   12.0f);
    [self addSubview:self.qrLine];
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.translation.y"];
    animation.fromValue = @(self.scanAreaRect.origin.y);
    animation.toValue = @(self.scanAreaRect.origin.y + self.scanAreaRect.size.height - 12);
    animation.repeatCount = NSIntegerMax;
    animation.autoreverses = YES;
    animation.duration = 1;
    [self.qrLine.layer addAnimation:animation forKey:nil];
}
#pragma mark - 绘制边框
- (void)drawRect:(CGRect)rect{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [self addScreenFillRect:ctx rect:self.bounds];
    [self addCenterClearRect:ctx rect:self.scanAreaRect];
    [self addWhiteRect:ctx rect:self.scanAreaRect];
    [self addCornerLineWithContext:ctx rect:self.scanAreaRect];
    [self startMoveLine];
}
- (void)addScreenFillRect:(CGContextRef)ctx rect:(CGRect)rect {
    CGContextSetRGBFillColor(ctx, 40 / 255.0,40 / 255.0,40 / 255.0,0.5);
    CGContextFillRect(ctx, rect);   
}
- (void)addCenterClearRect :(CGContextRef)ctx rect:(CGRect)rect {
    CGContextClearRect(ctx, rect);  
}
- (void)addWhiteRect:(CGContextRef)ctx rect:(CGRect)rect {
    CGContextStrokeRect(ctx, rect);
    CGContextSetRGBStrokeColor(ctx, 1, 1, 1, 1);
    CGContextSetLineWidth(ctx, 0.5);
    CGContextAddRect(ctx, rect);
    CGContextStrokePath(ctx);
}
- (void)addCornerLineWithContext:(CGContextRef)ctx rect:(CGRect)rect{
    CGContextSetLineWidth(ctx, 2);
    CGContextSetRGBStrokeColor(ctx, 1 /255.0, 255/255.0, 1/255.0, 1);
    CGPoint poinsTopLeftA[] = {
        CGPointMake(rect.origin.x+0.7, rect.origin.y),
        CGPointMake(rect.origin.x+0.7 , rect.origin.y + 15)
    };
    CGPoint poinsTopLeftB[] = {CGPointMake(rect.origin.x, rect.origin.y +0.7),CGPointMake(rect.origin.x + 15, rect.origin.y+0.7)};
    [self addLine:poinsTopLeftA pointB:poinsTopLeftB ctx:ctx];
    CGPoint poinsBottomLeftA[] = {CGPointMake(rect.origin.x+ 0.7, rect.origin.y + rect.size.height - 15),CGPointMake(rect.origin.x +0.7,rect.origin.y + rect.size.height)};
    CGPoint poinsBottomLeftB[] = {CGPointMake(rect.origin.x , rect.origin.y + rect.size.height - 0.7) ,CGPointMake(rect.origin.x+0.7 +15, rect.origin.y + rect.size.height - 0.7)};
    [self addLine:poinsBottomLeftA pointB:poinsBottomLeftB ctx:ctx];
    CGPoint poinsTopRightA[] = {CGPointMake(rect.origin.x+ rect.size.width - 15, rect.origin.y+0.7),CGPointMake(rect.origin.x + rect.size.width,rect.origin.y +0.7 )};
    CGPoint poinsTopRightB[] = {CGPointMake(rect.origin.x+ rect.size.width-0.7, rect.origin.y),CGPointMake(rect.origin.x + rect.size.width-0.7,rect.origin.y + 15 +0.7 )};
    [self addLine:poinsTopRightA pointB:poinsTopRightB ctx:ctx];
    CGPoint poinsBottomRightA[] = {CGPointMake(rect.origin.x+ rect.size.width -0.7 , rect.origin.y+rect.size.height+ -15),CGPointMake(rect.origin.x-0.7 + rect.size.width,rect.origin.y +rect.size.height )};
    CGPoint poinsBottomRightB[] = {CGPointMake(rect.origin.x+ rect.size.width - 15 , rect.origin.y + rect.size.height-0.7),CGPointMake(rect.origin.x + rect.size.width,rect.origin.y + rect.size.height - 0.7 )};
    [self addLine:poinsBottomRightA pointB:poinsBottomRightB ctx:ctx];
    CGContextStrokePath(ctx);
}
- (void)addLine:(CGPoint[])pointA pointB:(CGPoint[])pointB ctx:(CGContextRef)ctx {
    CGContextAddLines(ctx, pointA, 2);
    CGContextAddLines(ctx, pointB, 2);
}
@end
