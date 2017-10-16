#import "MZEMediaMarqueeLabel.h"
#import <QuartzCore/QuartzCore.h>

@implementation MZEMediaMarqueeLabel
-(id)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];

  self.label = [[MZEMediaEffectLabel alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
  [[self contentView] addSubview:self.label];

  // iOS 10+
  // [self setViewForContentSize:self.label];
  [self setContentSize:CGSizeMake(frame.size.width, frame.size.height)];

  [self setMarqueeScrollRate:30];
  [self setMarqueeDelay:3];
  [self setContentGap:32];

  return self;
}
-(void)layoutSubviews{
	[super layoutSubviews];
}
@end
