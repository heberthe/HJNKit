#import "DESUtils.h"

#define DESKEY @"hhw0108ela!~"
#define DESIV @"hhwelabt"
@implementation DESUtils

const Byte iv[] = {1, 2, 3, 4, 5, 6, 7, 8};
+ (NSString *)decryptUseDES:(NSString *)cipherText {
    NSString *plaintext = nil;

    NSData *cipherdata = [Base64 decode:cipherText];

    unsigned char buffer[8192];
    memset(buffer, 0, sizeof(char));
    size_t numBytesDecrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt, kCCAlgorithmDES, kCCOptionPKCS7Padding, [DESKEY UTF8String], kCCKeySizeDES, [DESIV UTF8String], [cipherdata bytes], [cipherdata length], buffer, 8192, &numBytesDecrypted);
    if (cryptStatus == kCCSuccess) {
        NSData *plaindata = [NSData dataWithBytes:buffer length:(NSUInteger)numBytesDecrypted];
        plaintext = [[NSString alloc] initWithData:plaindata encoding:NSUTF8StringEncoding];
    }
    return plaintext;
}

+ (NSString *)encryptUseDES:(NSString *)plainText {
    NSString *ciphertext = nil;
    NSData *textData = [plainText dataUsingEncoding:NSUTF8StringEncoding];
    NSUInteger dataLength = [textData length];
    unsigned char buffer[8192];
    memset(buffer, 0, sizeof(char));
    size_t numBytesEncrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt, kCCAlgorithmDES, kCCOptionPKCS7Padding, [DESKEY UTF8String], kCCKeySizeDES, [DESIV UTF8String], [textData bytes], dataLength, buffer, 8192, &numBytesEncrypted);
    if (cryptStatus == kCCSuccess) {
        NSData *data = [NSData dataWithBytes:buffer length:(NSUInteger)numBytesEncrypted];
        ciphertext = [Base64 encode:data];
    }
    return ciphertext;
}
@end
