//
//  ImageModel.h
//  UserInterfaceExample
//
//  Created by Nicholas Larsen on 9/1/21.
//

// Only allow one instance of this clas (a singleton class)

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ImageModel : NSObject

//+sharedInstance(); Functions that can be called as class methods, they don't need an instance the just need the name
//-sharedInstance(); There has* to be another way to get an instace
+(ImageModel*)sharedInstance;
-(UIImage*)getImageWithName:(NSString*)name;
-(UIImage*)getImageWithIndex:(NSInteger)index;
-(NSInteger)numberOfImages;
-(NSString*)getImageNameForIndex:(NSInteger)index;

//-(UIImage*)getImageWithName:(NSString*)name;

// Create NS array of images that we can provide (public cause it is in the .h)
//@property (strong, nonatomic) NSArray* imageNames;



@end

NS_ASSUME_NONNULL_END
