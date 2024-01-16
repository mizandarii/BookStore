/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bookstore;

import entity.Book;
import entity.Client;
import entity.OrderHistory;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

/**
 *
 * @author kristiinaparri
 * 
 * Создать модель магазина, продающего выбранный вид товаров. Необходимые функции:

1. Выход из программы

2. Добавить продукт

3. Список продаваемых продуктов

4. Добавить покупателя

5. Список зарегистрированных покупателей

6. Покупка покупателем продукта

7. Оборот магазина за все время работы

8. Добавить денег покупателю

9. Рейтинг покупателей по количеству покупок

10. Рейтинг продаваемости товаров

11. Редактирование товара

12. Редактирование пользователя

13. Предусмотреть выход из неправильно выбранной задачи.

В файл сохраняется массив сущностных объектов сериализованных в байты (не забудьте к сущностным классам добавить тип Serializable). При операции покупка (6) обеспечить уменьшение денег покупателя на цену товара.
 */
public class App {
    private List <Book> books = new ArrayList<>();
    private List <Client> clients = new ArrayList<>();
    
    private List<OrderHistory> orderHistories = new ArrayList<>();
    
    /**
     *
     */
    public void run(){
        String repeat = "r";
        Scanner scanner = new Scanner(System.in);
        int task;
        do{
            System.out.println("Выберите действие: ");
            System.out.println("0 - Выход из программы");
            System.out.println("1 - Добавление товара");
            System.out.println("2 - Добавление клиента");
            System.out.println("3 - Продажа товара");
            System.out.println("4 - Вывод списка товаров");
            System.out.println("5 - Вывод списка клиентов");
            System.out.println("6 - Добавление денег на счет клиента");
            System.out.println("7 - Рейтинг продаваемости товаров");
            System.out.println("8 - Рейтинг клиентов (кто купил на бОльшую сумму");
            System.out.println("9 - Оборот магазина за все время работы");
            System.out.println("10 - Редактирование клиента");
            System.out.println("11 - Редактирование товара");
            
            task = scanner.nextInt();
            
            
            switch(task){
                case 0:
                    repeat = "q";
                    break;
                case 1:
                    BookCreator bookCreator = new BookCreator();
                    books.add(bookCreator.returnNewBook());
                    break;
                case 2:
                    ClientCreator clientCreator = new ClientCreator();
                    clients.add(clientCreator.returnNewClient());
                    break;
                case 3:
                    OrderHistoryCreator orderHistoryCreator = new OrderHistoryCreator();
                    orderHistories.add(orderHistoryCreator.returnNewOrderHistory(books, clients));
                    break;
                case 4:
                    System.out.println("Список всех книг магазина");
                    /**System.out.println(books);**/
                    int count = 1;
                    for (Book book : books){
                        
                        /**System.out.println(Book.getBookName());**/
                        System.out.println(count + ". " + book.toString());
                    }
                    
                default:
                    System.out.println("Выберите одно из действий: ");
            }
        }while("r".equals(repeat));
    }
}
