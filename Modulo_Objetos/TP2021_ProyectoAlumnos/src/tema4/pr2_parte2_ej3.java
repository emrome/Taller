/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4;

/**
3-A- Modifique la clase Libro (carpeta tema 4) para ahora considerar que el primer autor 
es un objeto instancia de la clase Autor. Implemente la clase Autor, considerando que éstos 
se caracterizan por nombre y biografía. El autor debe poder devolver/modificar el valor de 
sus atributos. 
* 
B- Modifique el programa ppal. (carpeta tema 4) para instanciar un libro con su autor, 
considerando las modificaciones realizadas en A). Los datos se ingresan por teclado.
 */
import PaqueteLectura.Lector;
public class pr2_parte2_ej3 {
    public static void main(String[] args) {
        String titulo;
        Autor autor=new Autor();
        
        String editorial;
        int añoEdicion;
        String ISBN; 
        double precio; 
        Libro libro1;
        Libro libro2;
        
        //carga libro1
        System.out.println("Nombre Libro");
        titulo=Lector.leerString();
        System.out.println("Nombre autor");
        autor.setNombre(Lector.leerString());
        System.out.println("Biografia autor");
        autor.setBiografia(Lector.leerString());
        System.out.println("Editorial");
        editorial=Lector.leerString();
        System.out.println("Año Edicion");
        añoEdicion=Lector.leerInt();
        System.out.println("ISBN");
        ISBN=Lector.leerString();
        System.out.println("Precio");
        precio=Lector.leerDouble();
        libro1= new Libro(titulo,editorial,añoEdicion,autor,ISBN,precio);
        
        //carga libro2
        System.out.println("Nombre Libro");
        titulo=Lector.leerString();
        System.out.println("Nombre autor");
        autor.setNombre(Lector.leerString());
        System.out.println("Biografia autor");
        autor.setBiografia(Lector.leerString());
        System.out.println("Editorial");
        editorial=Lector.leerString();
        System.out.println("Año Edicion");
        System.out.println("ISBN");
        ISBN=Lector.leerString();
        System.out.println("Precio");
        
        libro2= new Libro(titulo,editorial,autor,ISBN);
        
        Libro libro3= new Libro();
        
        System.out.println(libro1.toString());
        System.out.println(libro2.toString());
        System.out.println("Precio del libro2: " +libro2.getPrecio());
        System.out.println("Año edición del libro2: " +libro2.getAñoEdicion());
         
    }
}
