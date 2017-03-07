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
#import "teste.h"
#import "testeViewController.h"

@interface ViewController ()

@property (strong) NSMutableArray * cont;
@end

@implementation ViewController



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
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    // Fetch the devices from persistent data store
    NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Coreda"];
    self.cont = [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
    
    
}

- (IBAction)btnTeste:(id)sender {
    testeViewController * tela = [ [UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"testeViewController"];
    

    [self.navigationController pushViewController:tela animated:YES];
    

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
