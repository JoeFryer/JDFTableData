//
//  JDFTableData.m
//  Pods
//
//  Created by Joe Fryer on 23/10/2015.
//
//

#import "JDFTableData.h"

@implementation JDFTableData

#pragma mark - Init

- (instancetype)initWithSections:(NSArray *)sections
{
    self = [super init];
    if (self) {
        self.sections = sections;
    }
    return self;
}


#pragma mark - Retrieving Rows

- (JDFTableRow *)tableRowForIndexPath:(NSIndexPath *)indexPath
{
    if (self.sections.count < indexPath.section) {
        return nil;
    }
    
    JDFTableSection *section = self.sections[indexPath.section];
    if (section.rows.count < indexPath.row) {
        return nil;
    }
    
    JDFTableRow *row = section.rows[indexPath.row];
    if (![row isKindOfClass:[JDFTableRow class]]) {
        return nil;
    }
    return row;
}

@end
