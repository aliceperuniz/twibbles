from typing import Optional

from pydantic import BaseModel


class User(BaseModel):
    id: int
    user_name: str
    profile_img_path: str
    password: Optional[str] = None
    email: Optional[str] = None
    is_private: Optional[bool] = None
    bio: Optional[str] = None
