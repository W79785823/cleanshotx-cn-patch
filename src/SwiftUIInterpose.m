#import <Foundation/Foundation.h>

extern void CNTranslateSwiftUIText(void);
extern void CNTranslateSwiftUIAttributedText(void);
extern void CNOriginalSwiftUIText(void) __asm__("_$s7SwiftUI4TextVyACxcSyRzlufC");
extern void CNOriginalSwiftUIAttributedText(void) __asm__("_$s7SwiftUI4TextVyAC10Foundation16AttributedStringVcfC");

__attribute__((used, section("__DATA,__interpose")))
static const struct {
    const void *replacement;
    const void *original;
} CNTextInterpositions[] = {
    { CNTranslateSwiftUIText, CNOriginalSwiftUIText },
    { CNTranslateSwiftUIAttributedText, CNOriginalSwiftUIAttributedText },
};
