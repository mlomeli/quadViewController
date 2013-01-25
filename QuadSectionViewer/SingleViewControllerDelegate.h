#import "MiniView.h"

@protocol SingleViewControllerDelegate

    @required
    - (MiniView*) getMiniView;

    @optional

@end