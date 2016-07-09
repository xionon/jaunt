require 'parser/current'
module Jaunt
  Stop = Struct.new(:text, :code_text, :sort_code, :filename)
  JAUNT_MATCH = /:jaunt-([[:alnum:]])/

  # Wraps Parser and extracts only our most interesting comments
  class CodeInspector
    attr_accessor :buffer, :ast_with_comments, :filename

    def initialize(filename)
      raise "No such file #{filename}" unless File.exist?(filename)
      self.filename = filename
      self.buffer = Parser::Source::Buffer.new(filename).read
      parser = Parser::CurrentRuby.new
      ast, comments = parser.parse_with_comments(buffer)
      self.ast_with_comments = Parser::Source::Comment.associate(ast, comments)
    end

    def stops
      ast_with_comments
        .to_a
        .map { |ast_snippet, comments| build_stop(ast_snippet, comments) }
        .sort { |left, right| sort_stops(left, right) }
    end

    def build_stop(ast_snippet, comments)
      loc = ast_snippet.loc
      line_range = (loc.first_line - 1)..loc.last_line
      code_text = limit_code_text_to_one_jaunt(buffer.source_lines[line_range])
      comment_text = comments.map(&:text).join("\n")

      Stop.new(
        comment_text,
        code_text.join("\n"),
        comment_text.match(JAUNT_MATCH)[1],
        filename
      )
    end

    def sort_stops(left, right)
      left_matchdata = left.text.match(JAUNT_MATCH)
      right_matchdata = right.text.match(JAUNT_MATCH)
      left_matchdata[1] <=> right_matchdata[1]
    end

    def limit_code_text_to_one_jaunt(source_lines)
      next_jaunt = source_lines.detect { |l| l.match(JAUNT_MATCH) }
      if next_jaunt
        source_lines[0..(source_lines.index(next_jaunt) - 1)]
      else
        source_lines
      end
    end
  end
end
