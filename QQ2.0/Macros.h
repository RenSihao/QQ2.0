//
//  Macros.h
//  QQ2.0
//
//  Created by RenSihao on 15/10/27.
//  Copyright © 2015年 RenSihao. All rights reserved.
//

#ifndef Macros_h
#define Macros_h

#pragma mark - frame

#define HEADER_HEIGHT 64
#define FOOTER_HEIGHT 49

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height


#pragma mark - color

#define QQDefaultColor [UIColor colorWithRed:0/255.0 green:165/255.0 blue:224/255.0 alpha:1.0]
#define QQColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define QQColorAlpha(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]

#endif /* Macros_h */
