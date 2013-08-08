//
//  Global.h
//  Flashlate
//
//  Created by yu-yu on 13/08/06.
//  Copyright (c) 2013年 yu-yu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Global : NSObject

#define RGB(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]
#define RGBA(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]

@end
