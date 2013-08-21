package myproject.common.aspect;

import java.util.Locale;

import javax.inject.Inject;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.aop.framework.Advised;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Service;

import anyframe.common.exception.BaseException;

import myproject.common.MovieFinderException;

@Aspect
@Service
public class ExceptionTransfer {

	@Pointcut("execution(* myproject..*Impl.*(..)) || execution(* anyframe.core.ria.mip..*MiPServiceImpl.*(..))")
	public void serviceMethod(){}

	@Inject
	private MessageSource messageSource;
	
	@AfterThrowing(pointcut="serviceMethod()", throwing="exception")
	public void transfer(JoinPoint thisJoinPoint, Exception exception)
			throws MovieFinderException {
		Object target = thisJoinPoint.getTarget();
		while (target instanceof Advised) {
			try {
				target = ((Advised) target).getTargetSource().getTarget();
			} catch (Exception e) {
				LogFactory.getLog(this.getClass()).error(
						"Fail to get target object from JointPoint.", e);
				break;
			}
		}

		String className = target.getClass().getSimpleName().toLowerCase();
		String opName = (thisJoinPoint.getSignature().getName()).toLowerCase();
		Log logger = LogFactory.getLog(target.getClass());

		if (exception instanceof MovieFinderException) {
			MovieFinderException movieFinderEx = (MovieFinderException) exception;
			logger.error(movieFinderEx.getMessage(), movieFinderEx);
			throw movieFinderEx;
		}
		
		if (exception instanceof BaseException) {
			BaseException baseEx = (BaseException) exception;
			logger.error(baseEx.getMessage(), baseEx);
			throw new MovieFinderException(messageSource, "error." + className + "."
					+ opName, new String[] {}, exception);
		}		

		logger.error(messageSource.getMessage("error." + className + "."
				+ opName, new String[] {}, "no messages", Locale.getDefault()),
				exception);

		throw new MovieFinderException(messageSource, "error." + className + "."
				+ opName, new String[] {}, exception);
	}
}
