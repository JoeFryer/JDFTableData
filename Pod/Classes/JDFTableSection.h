//
//  JDFTableSection.h
//  Pods
//
//  Created by Joe Fryer on 23/10/2015.
//
//

#import <Foundation/Foundation.h>

// JDFTableData
#import "JDFTableRow.h"



@interface JDFTableSection : NSObject

#pragma mark - Init
- (id)initWithHeaderString:(NSString *)headerString;
- (id)initWithHeaderString:(NSString *)headerString rows:(NSArray *)rows;

#pragma mark - Data
@property (nonatomic, copy) NSString *headerString;
@property (nonatomic, copy) NSString *footerString;
@property (nonatomic) UIView *headerView;
@property (nonatomic) UIView *footerView;
@property (nonatomic) NSArray *rows;

#pragma mark - Convenience
- (NSInteger)numberOfRows;
- (BOOL)addTableRowsWithTitles:(NSArray *)titles rowType:(JDFRowType)rowType;
- (BOOL)addTableRowsWithTitles:(NSArray *)titles subtitles:(NSArray *)subtitles primaryImages:(NSArray *)primaryImages rowType:(JDFRowType)rowType;
- (BOOL)addTableRowsWithTitles:(NSArray *)titles subtitles:(NSArray *)subtitles dataStrings:(NSArray *)dataStrings rowType:(JDFRowType)rowType;
- (BOOL)addTableRowsWithTitles:(NSArray *)titles subtitles:(NSArray *)subtitles dataStrings:(NSArray *)dataStrings primaryImages:(NSArray *)primaryImages rowType:(JDFRowType)rowType;
+ (NSArray *)tableRowsWithTitles:(NSArray *)titles subtitles:(NSArray *)subtitles primaryImages:(NSArray *)primaryImages dataStrings:(NSArray *)dataStrings withRowType:(JDFRowType)rowType;

@end
