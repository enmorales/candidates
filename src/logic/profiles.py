import os
import requests

URI_PROFILES = os.getenv('URI_PROFILES')

def get_candidates_profiles(data:any):
    skills_endpoint = f"{URI_PROFILES}/api/profiles/candidates"
    skills_response = requests.get(skills_endpoint,  json=data)
    if (skills_response.status_code == 200):
        skills = skills_response.json()
        return skills["data"]