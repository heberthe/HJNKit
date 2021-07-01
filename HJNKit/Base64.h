#import <Foundation/Foundation.h>

@interface Base64 : NSObject

+ (int)char2Int:(char)c;
+ (NSData *)decode:(NSString *)data;
+ (NSString *)encode:(NSData *)data;
@end
