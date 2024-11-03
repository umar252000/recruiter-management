package com.umar.recruiter.positonRepo;


import org.springframework.data.jpa.repository.JpaRepository;
import com.umar.recruiter.entity.Manager;

public interface ManagerRepository extends JpaRepository<Manager, Long> {
}
