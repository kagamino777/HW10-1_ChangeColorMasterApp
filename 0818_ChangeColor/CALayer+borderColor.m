//
//  CALayer+borderColor.m
//  0818_ChangeColor
//
//  Created by JaBa CHIA on 2020/9/2.
//

#import "CALayer+borderColor.h"
#import <UIKit/UIKit.h>
@implementation CALayer (borderColor)
- (void)setBorderColorWithUIColor:(UIColor *)color
{
    self.borderColor = color.CGColor;
}

@end
