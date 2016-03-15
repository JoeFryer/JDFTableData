//
//  JDFTableSection.m
//  Pods
//
//  Created by Joe Fryer on 23/10/2015.
//
//

#import "JDFTableSection.h"

@implementation JDFTableSection

#pragma mark - Init

- (id)initWithHeaderString:(NSString *)headerString
{
    return [self initWithHeaderString:headerString rows:nil];
}

- (id)initWithHeaderString:(NSString *)headerString rows:(NSArray *)rows
{
    self = [super init];
    if (self) {
        self.headerString = headerString;
        self.rows = rows;
    }
    return self;
}


#pragma mark - Getters

- (NSArray *)rows
{
    if (!_rows) {
        _rows = @[];
    }
    return _rows;
}


#pragma mark - Public

- (NSInteger)numberOfRows
{
    return self.rows.count;
}

- (BOOL)addTableRowsWithTitles:(NSArray *)titles rowType:(JDFRowType)rowType
{
    return [self addTableRowsWithTitles:titles subtitles:nil primaryImages:nil rowType:rowType];
}

- (BOOL)addTableRowsWithTitles:(NSArray *)titles subtitles:(NSArray *)subtitles primaryImages:(NSArray *)primaryImages rowType:(JDFRowType)rowType
{
    return [self addTableRowsWithTitles:titles subtitles:subtitles dataStrings:nil primaryImages:primaryImages rowType:rowType];
}

- (BOOL)addTableRowsWithTitles:(NSArray *)titles subtitles:(NSArray *)subtitles dataStrings:(NSArray *)dataStrings rowType:(JDFRowType)rowType
{
    return [self addTableRowsWithTitles:titles subtitles:subtitles dataStrings:dataStrings primaryImages:nil rowType:rowType];
}

- (BOOL)addTableRowsWithTitles:(NSArray *)titles subtitles:(NSArray *)subtitles dataStrings:(NSArray *)dataStrings primaryImages:(NSArray *)primaryImages rowType:(JDFRowType)rowType
{
    NSArray *newTableItems = [JDFTableSection tableRowsWithTitles:titles subtitles:subtitles primaryImages:primaryImages dataStrings:dataStrings withRowType:rowType];
    return [self addTableRows:newTableItems];
}

- (BOOL)addTableRow:(JDFTableRow *)tableRow
{
    if (tableRow && [tableRow isKindOfClass:[JDFTableRow class]]) {
        return [self addTableRows:@[tableRow]];
    }
    return NO;
}

- (BOOL)addTableRows:(NSArray<JDFTableRow *> *)tableRows
{
    if (tableRows) {
        NSMutableArray *tableItems = [self.rows mutableCopy];
        [tableItems addObjectsFromArray:tableRows];
        self.rows = [NSArray arrayWithArray:tableItems];
        return YES;
    } else {
        return NO;
    }
}

+ (NSArray *)tableRowsWithTitles:(NSArray *)titles subtitles:(NSArray *)subtitles primaryImages:(NSArray *)primaryImages dataStrings:(NSArray *)dataStrings withRowType:(JDFRowType)rowType
{
    NSParameterAssert(titles);
    
    if (!titles) {
        NSLog(@"**JDFToolkit** Error in: %s. \n Titles is mandatory. Returning nil.", __PRETTY_FUNCTION__);
        return nil;
    }
    if (subtitles && subtitles.count != titles.count) {
        NSLog(@"**JDFToolkit** Error in: %s. \n Count of Titles and Subtitles do not match. Returning nil.", __PRETTY_FUNCTION__);
        return nil;
    }
    if (primaryImages && primaryImages.count != titles.count) {
        NSLog(@"**JDFToolkit** Error in: %s. \n Count of Titles and Images do not match. Returning nil.", __PRETTY_FUNCTION__);
        return nil;
    }
    if (dataStrings && dataStrings.count != titles.count) {
        NSLog(@"**JDFToolkit** Error in: %s. \n Count of Titles and Data Strings do not match. Returning nil.", __PRETTY_FUNCTION__);
        return nil;
    }
    
    NSMutableArray *tableItems = [[NSMutableArray alloc] init];
    NSInteger i = 0;
    for (NSString *title in titles) {
        NSString *subtitle = subtitles[i];
        UIImage *primaryImage = primaryImages[i];
        NSString *dataString = dataStrings[i];
        JDFTableRow *tableItem = [[JDFTableRow alloc] initWithTitle:title rowType:rowType];
        tableItem.subtitle = subtitle;
        tableItem.primaryImage = primaryImage;
        tableItem.stringData = dataString;
        [tableItems addObject:tableItem];
        i++;
    }
    return [NSArray arrayWithArray:tableItems];
}

@end
