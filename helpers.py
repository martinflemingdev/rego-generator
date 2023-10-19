import os
import re
import markdown_it
import pandas as pd

# Function to add a "comments" column to a markdown table
def add_comments_column(markdown_text):
    # Parse the markdown using markdown-it-py
    md = markdown_it.MarkdownIt()
    html = md.render(markdown_text)

    # Find the table in the HTML using regex
    table_pattern = r'<table>(.*?)</table>'
    table_match = re.search(table_pattern, html, re.DOTALL)

    if table_match:
        table_html = table_match.group(0)

        # Convert the HTML table to a Pandas DataFrame
        df = pd.read_html(table_html)[0]

        # Add a "comments" column with empty values
        df['comments'] = ''

        # Convert the DataFrame back to an HTML table
        updated_table_html = df.to_html(index=False)

        # Replace the old table in the markdown with the updated one
        updated_markdown = re.sub(table_pattern, updated_table_html, html, flags=re.DOTALL)

        return updated_markdown

    return markdown_text

# Function to process a directory of markdown files
def process_directory(directory_path):
    for filename in os.listdir(directory_path):
        if filename.endswith(".md"):
            file_path = os.path.join(directory_path, filename)

            with open(file_path, "r") as file:
                markdown_content = file.read()

            updated_markdown = add_comments_column(markdown_content)

            with open(file_path, "w") as file:
                file.write(updated_markdown)

            print(f"Updated {filename}")

if __name__ == "__main__":
    directory_path = "/path/to/your/directory"  # Change this to your directory path
    process_directory(directory_path)
