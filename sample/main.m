//
//  main.m
//  sample
//
//  Created by Cenker Demir on 3/9/16.
//  Copyright © 2016 Cenker Demir. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
 
    // array to be sorted
    NSArray *middleEarthers = @[ @{ @"name"   : @"Bilbo"  ,
                                    @"age"    : @50       ,
                                    @"height" : @1.27     } ,
                                 @{ @"name"   : @"Thorin" ,
                                    @"age"    : @195      ,
                                    @"height" : @1.49     } ,
                                 @{ @"name"   : @"Balin"  ,
                                    @"age"    : @178      ,
                                    @"height" : @1.38     } ,
                                 @{ @"name"   : @"Dwalin" ,
                                    @"age"    : @169      ,
                                    @"height" : @1.50     } ,
                                 @{ @"name"   : @"Bifur"  ,
                                    @"age"    : @155      ,
                                    @"height" : @1.35     } ,
                                 
                                 @{ @"name"   : @"Bofur"  ,
                                    @"age"    : @155      ,
                                    @"height" : @1.45     } ,
                                 @{ @"name"   : @"Bombur" ,
                                    @"age"    : @155      ,
                                    @"height" : @1.35     } ,
                                 @{ @"name"   : @"Fíli"   ,
                                    @"age"    : @82       ,
                                    @"height" : @1.35     } ,
                                 @{ @"name"   : @"Kíli"   ,
                                    @"age"    : @77       ,
                                    @"height" : @1.43     } ,
                                 @{ @"name"   : @"Glóin"  ,
                                    @"age"    : @158      ,
                                    @"height" : @1.41     } ,
                                 
                                 @{ @"name"   : @"Óin"    ,
                                    @"age"    : @167      ,
                                    @"height" : @1.45     } ,
                                 @{ @"name"   : @"Dori"   ,
                                    @"age"    : @155      ,
                                    @"height" : @1.36     } ,
                                 @{ @"name"   : @"Ori"    ,
                                    @"age"    : @155      ,
                                    @"height" : @1.35     } ,
                                 @{ @"name"   : @"Gandalf",
                                    @"age"    : @2019     ,
                                    @"height" : @1.80     }
                                 ];
    
    //NSSortDescriptor for name
    NSSortDescriptor *sortByNameAsc = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES
                                                                     selector:@selector(caseInsensitiveCompare:)];
    
    //NSSortDescriptor for height, now name will be the secondary sort descriptor:
    NSSortDescriptor *sortByHeightDesc = [NSSortDescriptor sortDescriptorWithKey:@"height" ascending:NO];
    
    //another sort descriptor, this time it is for age!
    NSSortDescriptor *sortByAgeDesc = [NSSortDescriptor sortDescriptorWithKey:@"age" ascending:NO];
    
    //reversed sortByNameAsc:
    NSSortDescriptor *sortByNameDesc = [sortByNameAsc reversedSortDescriptor];
    
    // sorted arrays for various descriptors
    NSArray *alphabetizedMiddleEarthers = [middleEarthers sortedArrayUsingDescriptors:@[sortByNameAsc]];
    NSArray *middleEarthersByHeightByName = [middleEarthers sortedArrayUsingDescriptors:@[sortByHeightDesc, sortByNameAsc]];
    NSArray *middleEarthersByAgeByHeight = [middleEarthers sortedArrayUsingDescriptors:@[sortByAgeDesc, sortByHeightDesc]];
    NSArray *middleEarthersByageByHeightByName = [middleEarthers sortedArrayUsingDescriptors:@[sortByAgeDesc, sortByHeightDesc, sortByNameAsc]];
    NSArray *reversedAlphabetizedMiddleEarthers = [middleEarthers sortedArrayUsingDescriptors:@[sortByNameDesc]];
    
    // lets print them out on the console
    for (NSDictionary *character in alphabetizedMiddleEarthers) {
        NSLog(@"%@", character[@"name"]);
    }
    for (NSDictionary *character in middleEarthersByHeightByName) {
        NSLog(@"%@ is %@ mt tall.", character[@"name"], character[@"height"]);
    }
    for (NSDictionary *character in middleEarthersByAgeByHeight) {
        NSLog(@"%@ is %@ yr old and %@ mt tall.", character[@"name"], character[@"age"], character[@"height"]);
    }
    for (NSDictionary *character in middleEarthersByageByHeightByName) {
        NSLog(@"%@ is %@ yr old and %@ mt tall.", character[@"name"], character[@"age"], character[@"height"]);
    }
    for (NSDictionary *character in reversedAlphabetizedMiddleEarthers) {
        NSLog(@"%@", character[@"name"]);
    }

    //using nil to sort an array with same type of elements in it
    NSArray *numbers = @[@34, @8, @1, @5, @2, @55, @13, @1, @21, @3];
    NSArray *words = @[@"enters", @"cute", @"hills", @"dog", @"A", @"green", @"big"];
    
    //sort descriptor
    NSSortDescriptor *sortByNilAsc = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES];
    NSArray *fibonacciArray = [numbers sortedArrayUsingDescriptors:@[sortByNilAsc]];
    NSArray *sortedSentenceArray = [words sortedArrayUsingDescriptors:@[sortByNilAsc]];
    
    NSLog(@"%@", fibonacciArray);
    NSLog(@"%@", sortedSentenceArray);
    
    return 0;
}
