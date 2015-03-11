//
//  Entidade.h
//  iTunesSearch
//
//  Created by André Helaehil on 11/03/15.
//  Copyright (c) 2015 joaquim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Entidade : NSObject

@property (nonatomic, strong) NSString *nome;
@property (nonatomic, strong) NSString *trackId;
@property (nonatomic, strong) NSString *artista;
@property (nonatomic, strong) NSString *duracao;
@property (nonatomic, strong) NSString *genero;
@property (nonatomic, strong) NSNumber *preco;
@property (nonatomic, strong) NSString *imgUrl;
@property (nonatomic, strong) NSString *pais;
@property (nonatomic, strong) NSString *data;

@end
