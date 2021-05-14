package FrontEnd.Repository;

import org.springframework.data.jpa.repository.JpaRepository;

import FrontEnd.models.User;

public interface UserRepository extends JpaRepository<User, Integer>{

	User getByusername(String username);

}
