//
//  ViewController.m
//  CoreData
//
//  Created by Rodolfo Teixeira on 22/02/17.
//  Copyright © 2017 Rodolfo Teixeira. All rights reserved.
//

#import "ViewController.h"
#import <CoreData/CoreData.h>
#import "TableViewController.h"
#import "AppDelegate.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize device;

- (void)viewDidLoad {
    [super viewDidLoad];
          
}

-(NSManagedObjectContext *)managedObjectContext;
{
    
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        
        context = [delegate managedObjectContext];
    }
    NSLog(@"%@", context);
    return context;
}


- (IBAction)btnSalvar:(id)sender {
    NSManagedObjectContext *context = [self managedObjectContext];
    if ([_txtNome  isEqual:@""]) {
       
        
    }else{

    NSManagedObject *core = [NSEntityDescription insertNewObjectForEntityForName:@"Coreda" inManagedObjectContext:context];
    [core setValue:self.txtNome.text forKey:@"name"];
    NSLog(@"%@",_txtNome);
    
    NSError *error = nil;
    // Save the object to persistent store
    if (![context save:&error]) {
        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    }
    
    }
}
    


    


- (IBAction)btnFind:(id)sender {
    TableViewController * tela = [ [UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"tela"];
    
    [self.navigationController pushViewController:tela animated:YES];

}


    
    


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
