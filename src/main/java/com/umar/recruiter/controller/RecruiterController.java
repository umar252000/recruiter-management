package com.umar.recruiter.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.http.ResponseEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.umar.recruiter.entity.Candidate;
import com.umar.recruiter.entity.Company;
import com.umar.recruiter.entity.Manager;
import com.umar.recruiter.entity.Position;
import com.umar.recruiter.positonRepo.PositionRepository;
import com.umar.recruiter.service.RecruiterService;

import jakarta.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/recruiter")
public class RecruiterController {
	@Autowired
	private RecruiterService recruiterService;

	@GetMapping("/login")
	public String login() {
		return "login";
	}

	@PostMapping("/login")
	public String loginUser(@RequestParam("username") String username, @RequestParam("password") String password,
			Model model) {
		if (username.equalsIgnoreCase("Umar") && password.equals("12345")) {
			return "redirect:/recruiter/dashboard";
		}

		model.addAttribute("error", "Invalid username or password.");
		return "login";
	}

	@GetMapping("/dashboard")
	public String dashboard(Model model) {
		model.addAttribute("positions", recruiterService.getAllPositions());
		return "dashboard";
	}

	@GetMapping("/insertCandidate")
	public String insertCandidate(Model model) {
		List<Position> positions = recruiterService.getAllPositions();
		model.addAttribute("positions", positions);
		return "insertCandidate";
	}

	@PostMapping("/insertCandidate")
	public String insertCandidate(@ModelAttribute Candidate candidate, @RequestParam Long positionId) {
		Position position = recruiterService.getPosition(positionId);
		candidate.setPosition(position);
		recruiterService.saveCandidate(candidate);
		return "redirect:/recruiter/insertCandidate";
	}

	@GetMapping("/searchCandidates")
	public String searchCandidates(@RequestParam(required = false) String name, Model model) {
		List<Candidate> candidates = recruiterService.searchCandidates(name, name, name, name);
		System.out.println("Liastwdnwbdkj " + candidates);
		List<Position> positions = recruiterService.getAllPositions();
		model.addAttribute("positions", positions);
		model.addAttribute("candidates", candidates);
		return "searchCandidates";
	}

	@GetMapping("/insertPosition")
	public String showInsertPositionForm(Model model) {
		List<Company> companies = recruiterService.getAllCompanies();
		List<Manager> managers = recruiterService.getAllManagers();

		model.addAttribute("companies", companies);
		model.addAttribute("managers", managers);
		return "insertPosition";
	}

	@PostMapping("/insertPosition")
	public String insertPosition(@RequestParam Long companyId, @RequestParam Long managerId,
			@RequestParam String positionName, @RequestParam String jobDescription) {

		recruiterService.savePosition(companyId, managerId, positionName, jobDescription);
		return "redirect:/recruiter/insertPosition";
	}

	@GetMapping("/searchPositions")
	public String searchPositions(Model model) {
		List<Position> positions = recruiterService.getAllPositions();
		model.addAttribute("positions", positions);
		return "searchPositions";
	}

	// Post
	@GetMapping("/deletePosition/{id}")
	public String deletePosition(@PathVariable Long id) {
		recruiterService.deletePosition(id);
		return "redirect:/recruiter/searchPositions";
	}

	@PostMapping("/updatePositionStatus/{id}")
	public String updatePositionStatus(@PathVariable Long id, @RequestParam String status) {
		recruiterService.updatePositionStatus(id, status);
		return "redirect:/recruiter/searchPositions";
	}

	@GetMapping("/positions/edit/{id}")
	public String showEditPositionForm(@PathVariable Long id, Model model) {
		Position position = recruiterService.getPosition(id);
		List<Company> companies = recruiterService.getAllCompanies();
		List<Manager> managers = recruiterService.getAllManagers();

		model.addAttribute("companies", companies);
		model.addAttribute("managers", managers);

		model.addAttribute("position", position);
		return "edit-position";
	}

	@PostMapping("/positions/edit")
	public String editPosition(@ModelAttribute Position position) {
		System.out.println("Position = " + position);
		recruiterService.updatePosition(position);
		return "redirect:/recruiter/searchPositions";
	}

	@PostMapping("/updatePosition")
	public String updatePosition(@RequestParam Long candidateId, @RequestParam Long positionId) {
		Candidate candidate = recruiterService.getCandidateById(candidateId);
		if (candidate != null) {
			Position position = recruiterService.getPosition(positionId);
			candidate.setPosition(position);
			recruiterService.saveCandidate(candidate);
		}
		return "redirect:/recruiter/searchCandidates";
	}

	@GetMapping("/candidates/export")
	public void exportCandidates(@RequestParam(required = false) String name,
			@RequestParam(required = false) String qualification, @RequestParam(required = false) String designation,
			@RequestParam(required = false) String position, HttpServletResponse response) throws IOException {
		List<Candidate> candidates = recruiterService.searchCandidates(name, qualification, designation, position);

		byte[] excelFile = recruiterService.exportCandidatesToExcel(candidates);

		response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
		response.setHeader("Content-Disposition", "attachment; filename=candidates.xlsx");
		response.getOutputStream().write(excelFile);
		response.getOutputStream().flush();
	}

}
