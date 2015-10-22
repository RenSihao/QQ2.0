//
//  GroupInfo.m
//  QQ2.0
//
//  Created by RenSihao on 15/10/3.
//  Copyright © 2015年 RenSihao. All rights reserved.
//

#import "ContactInfo.h"
#import "GroupCellInfo.h"
#import "MemberCellInfo.h"

@implementation ContactInfo
+ (ContactInfo *)contactInfoInit:(NSArray *)array
{
    return [[self alloc] initWithArray:array];
}
- (instancetype)initWithArray:(NSArray *)array
{
    if(self  = [super init])
    {
        self.sectionArray = array;
    }
    return self;
}
+ (NSArray *)contactInfoPlist
{
    NSArray *plist = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Contact" ofType:@"plist"]];
    NSMutableArray *contactArray = [NSMutableArray array];
    for(NSArray *array in plist)
    {
        ContactInfo *contactInfo = [self contactInfoInit:array];
        /*----------GroupCellInfo数据模型----------*/
        NSMutableArray *groupArray = [NSMutableArray array];
        for(NSDictionary *groupDict in contactInfo.sectionArray)
        {
            GroupCellInfo *groupCellInfo = [GroupCellInfo groupCellInfoInit:groupDict];
            /*--------MemberCellInfo数据模型--------*/
            NSMutableArray *membersArray = [NSMutableArray array];
            for(NSDictionary *memberDict in groupCellInfo.members)
            {
                MemberCellInfo *memberCellInfo = [MemberCellInfo memberCellInfoWithDictionary:memberDict];
                [membersArray addObject:memberCellInfo];
            }
            /*--------MemberCellInfo数据模型分割线--------*/
            groupCellInfo.members = membersArray;
            [groupArray addObject:groupCellInfo];
        }
        contactInfo.sectionArray = groupArray;
        /*----------GroupCellInfo数据模型分割线----------*/
        [contactArray addObject:contactInfo];
    }
    return contactArray;
}

@end
