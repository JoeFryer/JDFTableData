//
//  JDFTableRow.m
//  Pods
//
//  Created by Joe Fryer on 23/10/2015.
//
//

#import "JDFTableRow.h"

@implementation JDFTableRow

- (instancetype)initWithTitle:(NSString *)title rowType:(JDFRowType)rowType
{
    self = [super init];
    if (self) {
        self.title = title;
        self.rowType = rowType;
    }
    return self;
}

@end
