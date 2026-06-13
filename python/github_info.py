#!/usr/bin/env python3
import urllib.request
import json

GITHUB_USER = "Carnag3"

def get_repos(username):
    url = f"https://api.github.com/users/{username}/repos?sort=updated"
    try:
        with urllib.request.urlopen(url) as response:
            repos = json.loads(response.read())
        print(f"\n📁 Репозитории пользователя {username}:")
        print("-" * 50)
        for repo in repos[:10]:
            name = repo['name']
            stars = repo['stargazers_count']
            lang = repo['language'] or 'Unknown'
            updated = repo['updated_at'][:10]
            print(f"  • {name} | ⭐{stars} | {lang} | {updated}")
        return repos
    except Exception as e:
        print(f"❌ Ошибка: {e}")
        return []

if __name__ == "__main__":
    repos = get_repos(GITHUB_USER)
    print(f"\nВсего репозиториев: {len(repos)}")
