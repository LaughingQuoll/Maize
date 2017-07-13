#import "MZERoundButton.h"
#import <UIKit/UIControl+Private.h>

@implementation MZERoundButton

- (id)initWithHighlightColor:(UIColor *)highlightColor {
	self = [super initWithFrame:CGRectZero];
	if (self) {

		_normalStateBackgroundView = [MZEMaterialView materialViewWithStyle:MZEMaterialStyleNormal];
		[_normalStateBackgroundView setFrame:CGRectMake(0,0,self.bounds.size.width,self.bounds.size.height)];
		[_normalStateBackgroundView setAutoresizingMask:0x12];
		[_normalStateBackgroundView setUserInteractionEnabled:NO];
		[self addSubview:_normalStateBackgroundView];

		_highlightStateBackgroundView = [[UIView alloc] initWithFrame:_normalStateBackgroundView.frame];
		[_highlightStateBackgroundView setAutoresizingMask:0x12];
		[_highlightStateBackgroundView setBackgroundColor:_highlightColor];
		[_highlightStateBackgroundView setUserInteractionEnabled:NO];
		[_highlightStateBackgroundView setAlpha:0.0];
		[self addSubview:_highlightStateBackgroundView];

		[self addTarget:self action:@selector(_touchDown:) forControlEvents:0x1];
		[self addTarget:self action:@selector(_touchUpOutside:) forControlEvents:0x80];
		[self addTarget:self action:@selector(_dragEnter:) forControlEvents:0x10];
		[self addTarget:self action:@selector(_dragExit:) forControlEvents:0x20];
		[self addTarget:self action:@selector(_primaryActionPerformed:) forEvents:0x2000];
		[self addObserver:self forKeyPath:@"enabled" options:0x0 context:0x0];
		[self addObserver:self forKeyPath:@"highlighted" options:0x0 context:0x0];
		[self addObserver:self forKeyPath:@"selected" options:0x0 context:0x0];
	}

	return self;
}

- (id)initWithGlyphPackage:(CAPackage *)glyphPackage highlightColor:(UIColor *)highlightColor {
	self = [self initWithHighlightColor:highlightColor];
	if (self) {
		_glyphPackage = glyphPackage;
		_glyphPackageView = [[MZECAPackageView alloc] init];
		[_glyphPackageView setAutoresizingMask:0x12];
		[_glyphPackageView setPackage:_glyphPackage];
		[self addSubview:_glyphPackageView];
		[self addObserver:self forKeyPath:@"glyphState" options:0x0 context:0x0];
	}
	return self;
}
- (id)initWithGlyphImage:(UIImage *)glyphImage highlightColor:(UIColor *)highlightColor {
	self = [self initWithHighlightColor:highlightColor];
	if (self) {
		_glyphImage = [glyphImage imageWithRenderingMode:0x2];
        _glyphImageView = [[UIImageView alloc] initWithImage:_glyphImage];
        [_glyphImageView setFrame:CGRectZero];
        [_glyphImageView setAutoresizingMask:0x12];
        [_glyphImageView setContentMode:0x4];
        [self addSubview:_glyphImageView];

        _highlightedGlyphView = [[UIImageView alloc] initWithImage:_glyphImage];
        [_highlightedGlyphView setFrame:CGRectZero];
        [_highlightedGlyphView setAutoresizingMask:0x12];
        [_highlightedGlyphView setContentMode:0x4];
        [_highlightedGlyphView setAlpha:0];
        [self addSubview:_highlightedGlyphView];
	}
	return self;
}

- (void)observeValueForKeyPath:(id)arg1 ofObject:(id)arg2 change:(id)arg3 context:(void *)arg4 {

}

- (void)_updateForStateChange {

}

- (void)_primaryActionPerformed:(id)arg1 {

}

- (void)_dragExit:(id)arg1 {

}

- (void)_dragEnter:(id)arg1 {

}

- (void)_touchUpOutside:(id)arg1 {

}

- (void)_touchDown:(id)arg1 {

}

- (void)_setCornerRadius:(CGFloat)cornerRadius {
	self.layer.cornerRadius = cornerRadius;
}

- (CGFloat)_cornerRadius {
	return self.layer.cornerRadius;
}

@end