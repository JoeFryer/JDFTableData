//
//  JDFTableData.h
//  Pods
//
//  Created by Joe Fryer on 23/10/2015.
//
//

#import <Foundation/Foundation.h>

// JDFTableData
#import "JDFTableRow.h"
#import "JDFTableSection.h"


@interface JDFTableData : NSObject

#pragma mark - Init
- (instancetype)initWithSections:(NSArray *)sections;

#pragma mark - Data
@property (nonatomic) NSArray *sections;

#pragma mark - Retrieving Table Data
- (JDFTableRow *)tableRowForIndexPath:(NSIndexPath *)indexPath;
- (NSInteger)numberOfSections;
- (NSInteger)numberOfRowsInSection:(NSInteger)section;

@end
