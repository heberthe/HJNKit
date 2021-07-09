#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonCrypto.h>
#import "Base64.h"

@interface DESUtils : NSObject

+ (NSString *)encryptUseDES:(NSString *)plainText;

+ (NSString *)decryptUseDES:(NSString *)cipherText;

@end
