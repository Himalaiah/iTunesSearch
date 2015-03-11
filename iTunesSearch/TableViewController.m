//
//  ViewController.m
//  iTunesSearch
//
//  Created by joaquim on 09/03/15.
//  Copyright (c) 2015 joaquim. All rights reserved.
//

#import "TableViewController.h"
#import "TableViewCell.h"
#import "iTunesManager.h"
#import "Entidade.h"
#import "Filme.h"
#import "Musica.h"

@interface TableViewController () {
    NSArray *midias;
    NSArray *secoes;
    NSMutableArray *midiasEncontradas;
}

@end

@implementation TableViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    UINib *nib = [UINib nibWithNibName:@"TableViewCell" bundle:nil];
    [self.tableview registerNib:nib forCellReuseIdentifier:@"celulaPadrao"];
    
    [_botao setTitle:NSLocalizedString(@"Search", @"Botão") forState:UIControlStateNormal];
    
    [_tableview setDelegate:self];
    _tableview.dataSource = self;
    
#warning Necessario para que a table view tenha um espaco em relacao ao topo, pois caso contrario o texto ficara atras da barra superior
    self.tableview.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.tableview.bounds.size.width, 15.f)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Metodos do UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [midias count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *celula = [self.tableview dequeueReusableCellWithIdentifier:@"celulaPadrao"];
    
    Entidade *filme = [midias objectAtIndex:indexPath.row];
    [celula.nome setText:filme.nome];
    [celula.artista setText:filme.artista];
    if (filme.preco == nil) {
        [celula.preco setText:@"Grátis"];
    }
    else{
        [celula.preco setText:[NSString stringWithFormat:@"Preço: $%@", filme.preco]];
    }
    return celula;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 25;
}

- (IBAction)search:(id)sender {
    iTunesManager *itunes = [iTunesManager sharedInstance];
    midias = [itunes buscarMidias:[NSString stringWithFormat:@"%@", self.texto.text]];
    [self.view endEditing:YES];
    [self.tableview reloadData];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

@end
