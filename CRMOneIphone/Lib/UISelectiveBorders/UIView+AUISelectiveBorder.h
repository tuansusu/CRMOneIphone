//
//  UIView+AUISelectiveBorder.h
//  AUISelectiveBordersView
//
//  Created by Adam Siton on 1/26/12.
//
//Permission is hereby granted, free of charge, to any person obtaining a copy
//of this software and associated documentation files (the "Software"), to deal
//in the Software without restriction, including without limitation the rights
//to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//copies of the Software, and to permit persons to whom the Software is
//furnished to do so, subject to the following conditions:
//
//The above copyright notice and this permission notice shall be included in
//all copies or substantial portions of the Software.
//
//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//THE SOFTWARE.

#import <UIKit/UIKit.h>
#import "AUISelectiveBordersLayer.h"

// Importing this category will replace UIView's default CALayer with an AUISelectiveBordersLayer, so that you can use the selective borders directly as properties of the view.
@interface UIView (AUISelectiveBorder)

@property (nonatomic, strong) UIColor *selectiveBordersColor;
@property (nonatomic) float selectiveBordersWidth;
@property (nonatomic) AUISelectiveBordersFlag selectiveBorderFlag;

+(Class) layerClass;

-(void) setSelectiveBorderWithColor : (UIColor*) inputColor withBorderWith : (float) inputBorderWith withBorderFlag : (AUISelectiveBordersFlag) inputBorderFlag;

@end
