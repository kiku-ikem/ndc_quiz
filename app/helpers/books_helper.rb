module BooksHelper
    def formatted_book_info(book)
      # 1行目: タイトル
      line1 = book.title.to_s
  
      # 2行目以降を組み立て
      parts = []
      parts << "#{book.author}." if book.author.present?
      parts << "#{book.edition}." if book.edition.present?
  
      # 出版社, 出版年.
      if book.publisher.present? && book.publication_year.present?
        parts << "#{book.publisher}, #{book.publication_year}."
      elsif book.publisher.present?
        parts << "#{book.publisher}."
      elsif book.publication_year.present?
        parts << "#{book.publication_year}."
      end
  
      parts << "(#{book.series_name})." if book.series_name.present?
      line2 = parts.join(" -- ")
  
      # line2が空なら省略
      [line1, line2.presence].compact.join("\n")
    end
  end