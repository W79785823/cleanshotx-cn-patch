#define CLEANSHOT_CN_EXPORT
#import "../src/CleanShotCN.m"

int main(int argumentCount, const char *arguments[]) {
    @autoreleasepool {
        if (argumentCount != 2) return 1;
        NSError *error;
        NSData *data = [NSPropertyListSerialization dataWithPropertyList:CNTranslationMap()
                                                                format:NSPropertyListBinaryFormat_v1_0
                                                               options:0
                                                                 error:&error];
        NSString *path = [NSString stringWithUTF8String:arguments[1]];
        if (!data || ![data writeToFile:path options:NSDataWritingAtomic error:&error]) {
            fprintf(stderr, "%s\n", error.localizedDescription.UTF8String);
            return 1;
        }
        printf("Exported %lu translations\n", (unsigned long)CNTranslationMap().count);
    }
    return 0;
}
