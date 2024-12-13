# コンパイラとフラグの設定
OCAMLOPT = ocamlopt
FLAGS = -I build

# ソースファイル
ML_SOURCES = ft_ref.ml
CMX_OBJECTS = $(ML_SOURCES:%.ml=build/%.cmx)

# 実行ファイル名
TARGET = a.out

# デフォルトターゲット
all: $(TARGET)

# buildディレクトリの作成
build:
	mkdir -p build

# オブジェクトファイル（.cmx）のコンパイル
build/%.cmx: %.ml | build
	$(OCAMLOPT) $(FLAGS) -c $< -o $@
	if [ -f *.cmi ]; then mv *.cmi build/; fi
	if [ -f *.o ]; then mv *.o build/; fi

# 実行ファイルの生成
$(TARGET): $(CMX_OBJECTS)
	$(OCAMLOPT) $(FLAGS) -o $@ $(CMX_OBJECTS)

# ビルドディレクトリの削除
clean:
	rm -rf build

# 完全クリーン（実行ファイルも削除）
fclean: clean
	rm -f $(TARGET)

# 再ビルド
re: fclean all

.PHONY: all clean fclean re