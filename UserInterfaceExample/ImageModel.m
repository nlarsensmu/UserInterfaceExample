//
//  ImageModel.m
//  UserInterfaceExample
//
//  Created by Nicholas Larsen on 9/1/21.
//

#import "ImageModel.h"

@implementation ImageModel
NSArray* imageNames;
NSMutableDictionary<NSString*, UIImage*>* images;

//@synthesize imageNames = _imageNames;

+(ImageModel*)sharedInstance{
    static ImageModel* _sharedInstance = nil;
    
    static dispatch_once_t predicate;
    
    // Will run this block of code one time and never again for the app
    dispatch_once(&predicate, ^{
        _sharedInstance = [[ImageModel alloc] init];
    } );
    
    return _sharedInstance;
}

// Overwrite getter
-(NSArray*) imageNames{
    
    if(!imageNames) {       // If ImageNames is nil, set it to empty and return it
        imageNames = @[@"Bill", @"Eric", @"Jeff", @"NicolBoalsTheRavenger",@"NivMizzzetParun",@"TibaltsTrickery"];
    }
    
    return imageNames;
}

-(NSMutableDictionary<NSString*, UIImage*>*) images{
    if(!images) {
        images = [[NSMutableDictionary<NSString*, UIImage*> alloc] init];
    }
    return images;
}

-(UIImage*)getImageWithName:(NSString*)name{
    UIImage* image = [self.images valueForKey:name];
    if(image == nil) {
        image = [UIImage imageNamed:name];
        self.images[name] = image;
    }
    return image;
}

-(UIImage*)getImageWithIndex:(NSInteger)index{
    NSString* name = self.imageNames[index];
    return [self getImageWithName:name];
}

-(NSInteger)numberOfImages{
    return self.imageNames.count;
}

-(NSString*)getImageNameForIndex:(NSInteger)index{
    return self.imageNames[index];
}

@end
