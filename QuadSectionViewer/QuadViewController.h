//
//  QuadViewController.h
//  QuadSectionViewer
//
//  Created by Adrián García Betancourt on 25/01/13.
//  Copyright (c) 2013 Miguel Ángel Lomelí Cantú. All rights reserved.
//

/*
 * UIViewController que muestra las vistas de 4 UIViewController en pantalla.
 * Modo de uso: la implementacion de QuadViewController debe especificar el dataSource y
 * opcionalmente la duracion de la animacion de expander/colapsar. El dataSource debe ser
 * un NSArray con exactamente 4 elementos del tipo Class, los cuales implementan el protocolo
 * QuadViewControllerDataSource.
 *
 * El protocolo QuadViewControllerDataSource especifica un metodo estatico, controllerView, que
 * debe regresar un objecto UIView que contenga la vista preliminar del UIViewController que se
 * desea mostrar en pantalla. Esta vista preliminar debe tener un frame igual al applicationFrame.
 *
 * Por el momento QuadViewController funciona correctamente cuando la NavigationBar se encuentra oculta.
 */

#import <UIKit/UIKit.h>

@protocol QuadViewControllerDataSource;

@interface QuadViewController : UIViewController

@property CGFloat animationDuration;
@property NSArray<QuadViewControllerDataSource> *dataSource;

@end

@protocol QuadViewControllerDataSource

+ (UIView *)controllerView;

@end
