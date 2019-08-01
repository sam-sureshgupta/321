public class ProductInfo {
  public String prodName;
    public Decimal prodPrice;
    public Decimal quantity;
    public Decimal total;
    public ProductInfo(String name,Decimal price){
        prodName=name;
        prodPrice=price;
        quantity=10;
    }
    public void calculate(){
        total =prodPrice*quantity;
        System.debug('Quantity:'+quantity);
        System.debug('Price:'+prodPrice);
        System.debug('Total:'+total);
    }
}