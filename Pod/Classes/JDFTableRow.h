//
//  JDFTableRow.h
//  Pods
//
//  Created by Joe Fryer on 23/10/2015.
//
//

#import <Foundation/Foundation.h>



/**
 *  JDFRowType enum.
 
    Used to specify what type of cell a table row requires.
 */
typedef NS_ENUM(NSInteger, JDFRowType){
    /**
     *  Denotes a row that displays data
     */
    JDFRowTypeDataDisplay,
    /**
     *  Denotes a row that displays an extended amount of data
     */
    JDFRowTypeExtendedDataDisplay,
    /**
     *  Denotes a row that displays an image
     */
    JDFRowTypeImageDisplay,
    /**
     *  Denotes a row that has performs some kind of action when tapped
     */
    JDFRowTypeActionCell,
    /**
     *  Denotes a row that allows data entry
     */
    JDFRowTypeDataEntry,
    /**
     *  Denotes a row that navigates to another view controller when tapped
     */
    JDFRowTypeNavigation,
    /**
     *  Denotes a row that allows entering a date
     */
    JDFRowTypeDateEntry,
    /**
     *  Denotes a row that allows entering a currency value
     */
    JDFRowTypeCurrencyEntry,
    /**
     *  Denotes a row that allows entering a number
     */
    JDFRowTypeNumberEntry,
    /**
     *  Denotes a row that allows entering an email address
     */
    JDFRowTypeEmailAddressEntry,
    /**
     *  Denotes a row that allows entering a password
     */
    JDFRowTypePasswordEntry,
    /**
     *  Denotes a row that has a switch control
     */
    JDFRowTypeSwitch,
    /**
     *  Denotes a row that has a slider control
     */
    JDFRowTypeSlider,
    /**
     *  Denotes a row that has a segmented control
     */
    JDFRowTypeSegmentedControl
};



@interface JDFTableRow : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;
@property (nonatomic, copy) NSString *stringData;
@property (nonatomic) UIImage *primaryImage;
@property (nonatomic) UIImage *secondaryImage;
@property (nonatomic) UIImage *tertiaryImage;
@property (nonatomic) id dataObject;

@property (nonatomic) JDFRowType rowType;
@property (nonatomic, copy) NSString *userDefinedTypeIdentifier;

- (instancetype)initWithTitle:(NSString *)title rowType:(JDFRowType)rowType;

@end
