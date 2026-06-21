package user

type user struct {
	Name string
}

func New(name string) *user {
	u := user{}
	u.Name = name

	return &u
}
