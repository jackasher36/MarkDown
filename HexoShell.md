# HexoShell

```sh
#!/bin/bash
# 设置Hexo博客目录
hexo_dir="/root/blog"

# 设置Markdown文件目录
markdown_dir="/root/Markdown"

category=Jack
tag=Blog

read -p "输入你想要的存放的目录:" category
read -p "输入你想要打上的标签:" tag

# 获取当前时间并格式化
current_date=$(date "+%Y-%m-%d %H:%M:%S")
current_time=$(date "%H:%M:%S")

if [ -z "$category" ]; then
  category="Jack"
fi

if [ -z "$tag" ]; then
  tag="Blog"
fi

for file in "$markdown_dir"/*.md; do
    # 检查文件是否存在
    if [ -f "$file" ]; then
        # 获取文件名（不包含扩展名）
        filename=$(basename -- "$file" .md)

        # 检查目标目录是否已存在同名文件
        if [ -f "$hexo_dir/source/_posts/$filename.md" ]; then
            echo "Skipping $filename.md - File already exists in destination directory."
            # 删除原始Markdown文件
            rm "$file"
            echo "Deleted $filename.md from $markdown_dir/"
        else
            # 获取当前时间并格式化
            current_time=$(date "+%Y-%m-%d %H:%M:%S")

	    #将信息展示在文章中增加发布日期
            echo -e "\nTime: $current_time\nAuthor: Jackasher" | cat - "$file" > temp && mv temp "$file"

            # 添加front matter到文件中，包括当前时间
            echo -e "---\ntitle: $filename\ncategories: $category\ntags: $tag\n---\n" | cat - "$file" > temp && mv temp "$file"

            # 将Markdown文件复制到Hexo博客目录
            mv "$file" "$hexo_dir/source/_posts/"
            echo "Moved $filename.md to $hexo_dir/source/_posts/"
        fi
    fi
done

cd "$hexo_dir"

hexo generate
```

