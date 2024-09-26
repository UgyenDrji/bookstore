import 'package:bookstore/modelclass/model_class.dart';

List<BookModel> allBooks = [
  BookModel(
      bookName: "The Da Vinci Code",
      author: "Dan Brown",
      publishDate: "March 18, 2003",
      price: 18.99,
      rating: "4.9",
      quantity: 0,
      summary: "The Da Vinci Code by Dan Brown The Da Vinci Code is a mystery thriller novel that follows symbologist Robert Langdon and cryptologist Sophie Neveu as they unravel a conspiracy related to the Holy Grail. They discover that the Grail is not a cup, but rather the womb of Mary Magdalene, who carried the bloodline of Jesus Christ. The novel explores themes of art, history, and conspiracy, taking the reader on a thrilling adventure through Paris and London.",
      img: "assets/image/book1.jpg"
  ),
  BookModel(
      bookName: "To Kill a Mockingbird",
      author: "Harper Lee",
      rating: "4.7",
      publishDate: "July 11, 1960",
      summary: "To Kill a Mockingbird by Harper Lee Set in the Deep South during the 1930s, To Kill a Mockingbird is a classic novel about racial injustice, tolerance, and the loss of innocence. The story is told through the eyes of Scout Finch, a young girl whose father, Atticus, decides to defend a black man accused of raping a white woman. As the trial approaches, Scout and her brother Jem learn about the realities of racial tension and the importance of empathy and understanding.",
      price: 15.99,
      quantity: 0,
      img: "assets/image/book2.jpg"
  ),
  BookModel(
      bookName: "The Alchemist",
      author: "Paulo Coelho ",
      publishDate: "April 25, 1988",
      summary: "The Alchemist by Paulo Coelho The Alchemist is a fable about a young shepherd named Santiago, who embarks on a journey to fulfill his personal legend and find his treasure. Along the way, he meets various people who teach him about the art of alchemy and the importance of listening to his heart. The novel is a spiritual and philosophical exploration of the nature of dreams, destiny, and the universe.",
      price: 12.99,
      quantity: 0,
      rating: "3.9",
      img: "assets/image/book3.webp"),
  BookModel(
      bookName: "1984",
      author: "George Orwell",
      publishDate: "June 8, 1949 ",
      summary: "1984 by George Orwell 1984 is a dystopian novel that depicts a totalitarian future society where the government exercises total control over its citizens. The story follows Winston Smith, a low-ranking member of the ruling Party, who begins to question the official ideology and eventually rebels against the government. The novel is a warning about the dangers of government control, propaganda, and the loss of individual freedom.",
      price: 10.99,
      quantity: 0,
      rating: "3.8",
      img: "assets/image/book4.jpg"),
  BookModel(
      bookName: "The Nightingale",
      summary: "The Nightingale by Kristin Hannah The Nightingale is a historical fiction novel set in France during World War II. The story follows two sisters, Vianne and Isabelle, as they navigate the difficulties and horrors of war. Vianne tries to maintain a sense of normalcy and protect her family, while Isabelle joins the French Resistance and becomes embroiled in the fight against the Nazis. The novel explores themes of love, loss, and resilience in the face of war.",
      author: "Kristin Hannah",
      publishDate: "February 3, 2015 ",
      price: 16.99,
      rating: "4,5",
      quantity: 0,img: "assets/image/book5.jpg"),
  BookModel(
      bookName: "The Hitchhiker's Guide",
      author: "Douglas Adams ",
      publishDate: "October 12, 1979",
      summary: "The Hitchhiker's Guide to the Galaxy by Douglas Adams The Hitchhiker's Guide to the Galaxy is a comedic science fiction series that follows the misadventures of an unwitting human named Arthur Dent and his alien friend Ford Prefect. When Earth is destroyed to make way for a hyperspace bypass, Arthur and Ford hitch a ride on a passing spaceship and embark on a journey through space, encountering various bizarre and humorous situations along the way.",
      price: 14.99,
      rating: "3",
      quantity: 0,img: "assets/image/book6.jpg"),
  BookModel(
      bookName: "Pride and Prejudice",
      summary: "Pride and Prejudice by Jane Austen Pride and Prejudice is a classic romance novel that follows the lives of the Bennett sisters, particularly Elizabeth and her relationship with the wealthy Mr. Darcy. Initially, Elizabeth is put off by Darcy's pride and perceived arrogance, while Darcy is equally disapproving of Elizabeth's family's inferior social status. As they continue to cross paths, they must confront their own biases and prejudices, leading to a romantic and humorous exploration of love, class, and social status.",
      author: "Jane Austen",
      publishDate: "January 28, 1813",
      rating: "5",
      price: 9.99,
      quantity: 0,img: "assets/image/book7.jpg"),
];

List<PaymentModel> allMethods = [
  PaymentModel(
      paymentMethod: "Cash On Delivery",
      imgUrl: "assets/image/cash.png"),
  PaymentModel(
      paymentMethod: "Credit Card",
      imgUrl: "assets/image/credit.png"),
  PaymentModel(
      paymentMethod: "Master Card",
      imgUrl: "assets/image/master.png"
  ),
];

List<Register> userInfo=[];